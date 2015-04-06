package com.hexor.service;

import com.hexor.repo.FileBaseInfo;
import com.hexor.repo.Pager;

import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 15-2-2
 * Time: 下午10:54
 * To change this template use File | Settings | File Templates.
 */
public interface IFileBaseInfoService {
    public void insertFile(FileBaseInfo fileBaseInfo);
    public String checkSameFile(FileBaseInfo fileBaseInfo);
    public List<FileBaseInfo> limit(Pager pager);
    public long getCounts(Pager pager);
    public List<FileBaseInfo> selectInIds(List list);
    public void deleteInIds(List list);
    public void recoverInIds(List list);
    public void reductionInIds(List list);
    public List<FileBaseInfo> searchFileName(String fileName);
    public long getTotalUsed(String userId);
    public long getTotalDownloads(String userId);
    public long getTotalUploads(String userId);
    public void fileDownloadsAdd(Map map);
    public List<FileBaseInfo> getHotFiles(String userId);
    public List<FileBaseInfo> getRecentlyFiles(String userId);
    public FileBaseInfo selectById(String id);
}
