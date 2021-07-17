package org.pachinko.exception;

public class PCKRuntimeException extends RuntimeException {

    private ExceptionEnum exceptionEnum;

    public PCKRuntimeException(ExceptionEnum exceptionEnum) {
        this.exceptionEnum = exceptionEnum;
    }

    public ExceptionEnum getExceptionEnum() {
        return exceptionEnum;
    }
}
