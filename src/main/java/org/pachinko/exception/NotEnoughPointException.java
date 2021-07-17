package org.pachinko.exception;

public class NotEnoughPointException extends PCKRuntimeException {

    public NotEnoughPointException(ExceptionEnum exceptionEnum) {
        super(exceptionEnum);
    }

}
