package org.pachinko.exception;

public class InvalidStartTimeException extends PCKRuntimeException {

    public InvalidStartTimeException(ExceptionEnum exceptionEnum) {
        super(exceptionEnum);
    }

}
