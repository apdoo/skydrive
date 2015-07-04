package com.hexor.common;

import java.util.EventListener;

/**
 * Created with IntelliJ IDEA.
 * User: hexor
 * Date: 2015-06-27
 * Time: 16:43
 * 发帖listener 监听
 */
public interface PostTaskThreadListener extends EventListener {
    public void afterPerDown(PostTaskThreadEvent event);
    public void downCompleted(PostTaskThreadEvent event);
}
