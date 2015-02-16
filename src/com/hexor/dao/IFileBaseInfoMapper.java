package com.hexor.dao;

import com.hexor.repo.FileBaseInfo;
import com.hexor.repo.Pager;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: Dong
 * Date: 14-8-27
 * Time: 下午2:49
 * To change this template use File | Settings | File Templates.
 */
@Service("com.hexor.dao.IFileBaseInfoMapper")
public interface IFileBaseInfoMapper {
     public void insertFile(FileBaseInfo fileBaseInfo);
     public FileBaseInfo checkSameFile(FileBaseInfo fileBaseInfo);
     public List<FileBaseInfo> limit(Pager pager);
    public long getCounts(Pager pager);
    public List<FileBaseInfo> selectInIds(List list);
    public void deleteInIds(List list);
    public void recoverInIds(List list);
    public void reductionInIds(List list);
    public List<FileBaseInfo> searchFileName(String fileName);
    public String getTotalUsed(String userId);
    public String getTotalDownloads(String userId);
    public long getTotalUploads(String userId);
    public void fileDownloadsAdd(Map map);
    public List<FileBaseInfo> getHotFiles(String userId);
    public List<FileBaseInfo> getRecentlyFiles(String userId);
}
