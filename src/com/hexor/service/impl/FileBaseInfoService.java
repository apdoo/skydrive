package com.hexor.service.impl;

import com.hexor.dao.IFileBaseInfoMapper;
import com.hexor.repo.FileBaseInfo;
import com.hexor.repo.Pager;
import com.hexor.service.IFileBaseInfoService;
import com.hexor.util.DateUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 15-2-2
 * Time: 下午10:54
 * To change this template use File | Settings | File Templates.
 */
@Service("com.hexor.service.impl.FileBaseInfoService")
public class FileBaseInfoService implements IFileBaseInfoService {
    @Autowired
    @Qualifier("com.hexor.dao.IFileBaseInfoMapper")
    private IFileBaseInfoMapper mapper;
    public void setMapper(IFileBaseInfoMapper delegate) {
        this.mapper = delegate;
    }

    @Override
    public void insertFile(FileBaseInfo fileBaseInfo) {
        mapper.insertFile(fileBaseInfo);
    }

    @Override
    public String checkSameFile(FileBaseInfo bean) {
        String fileName="";
        //检查是否存在同id同名的文件
        FileBaseInfo sameBean= mapper.checkSameFile(bean);
        if(sameBean!=null){
            //扩展名格式：
            String extName="";
            if (sameBean.getFileName().lastIndexOf(".") >= 0)  {
                fileName=sameBean.getFileName().substring(0,sameBean.getFileName().lastIndexOf("."));
                extName= sameBean.getFileName().substring(sameBean.getFileName().lastIndexOf(".")) ;
                fileName=fileName+DateUtil.getStrOfDate()+extName;
            }
            sameBean.setFileName(fileName);
            //插入上传文件记录
            mapper.insertFile(sameBean);
        }else{
            fileName=bean.getFileName();
           mapper.insertFile(bean);
        }

          return fileName;
    }

    @Override
    public List<FileBaseInfo> limit(Pager pager) {
         return mapper.limit(pager);
    }

    @Override
    public long getCounts(Pager pager) {
        return mapper.getCounts(pager);
    }

    @Override
    public List<FileBaseInfo> selectInIds(List list) {
        return mapper.selectInIds(list) ;
    }

    @Override
    public void deleteInIds(List list) {
        mapper.deleteInIds(list);
    }

    @Override
    public void recoverInIds(List list) {
        mapper.recoverInIds(list);
    }

    @Override
    public void reductionInIds(List list) {
        mapper.reductionInIds(list);
    }

    @Override
    public List<FileBaseInfo> searchFileName(String fileName) {
        return mapper.searchFileName(fileName);
    }

    @Override
    public long getTotalUsed(String userId) {
        String count= mapper.getTotalUsed(userId);
        if(count==null||count.equals("null"))  return 0;
        return    Long.parseLong(count);
    }

    //mysql 中sum查询 不存在的话 会返回NULL，需要处理下
    @Override
    public long getTotalDownloads(String userId) {
        String count= mapper.getTotalDownloads(userId);
        if(count==null||count.equals("null"))  return 0;
        return    Long.parseLong(count);
    }

    @Override
    public long getTotalUploads(String userId) {
        long count= mapper.getTotalUploads(userId);
        return count;
    }

    @Override
    public void fileDownloadsAdd(Map map) {
        mapper.fileDownloadsAdd(map);
    }

    @Override
    public List<FileBaseInfo> getHotFiles(String userId) {
        return mapper.getHotFiles(userId);
    }

    @Override
    public List<FileBaseInfo> getRecentlyFiles(String userId) {
        return mapper.getRecentlyFiles(userId);
    }
}
