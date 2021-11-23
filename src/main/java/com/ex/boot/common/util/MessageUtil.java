package com.ex.boot.common.util;

import org.springframework.context.MessageSource;
import org.springframework.stereotype.Component;

@Component
public class MessageUtil {

    private MessageSource messageSource;

    public MessageUtil(MessageSource messageSource) {
        this.messageSource = messageSource;
    }


}
