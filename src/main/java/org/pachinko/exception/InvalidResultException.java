package org.pachinko.exception;

public class InvalidResultException extends PCKRuntimeException {

    public InvalidResultException(ExceptionEnum exceptionEnum) {
        super(exceptionEnum);
    }

}