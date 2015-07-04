package com.hexor.common;

import java.util.EventObject;

/**
 * Created with IntelliJ IDEA.
 * User: hexor
 * Date: 2015-06-27
 * Time: 16:46
 */
public class PostTaskThreadEvent extends EventObject {


    private static final long serialVersionUID = 1L;
    Object sourObject;//被监听的事件源
    long count;
    /**
     * Constructs a prototypical Event.
     *
     * @param sourceObject The object on which the Event initially occurred.
     * @throws IllegalArgumentException if source is null.
     */
    public PostTaskThreadEvent(Object sourceObject, long count) {
        super(sourceObject);
        this.sourObject = sourceObject;
        this.count = count;
    }
    long getCount() {
        return count;
    }

    Object getTarget() {
        return sourObject;
    }
}
