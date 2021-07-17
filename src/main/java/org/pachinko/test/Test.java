package org.pachinko.test;

import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.Executors;

/**
 * Description:
 */
public class Test {

    public static void main(String[] args) {
        ArrayBlockingQueue arrayBlockingQueue = new ArrayBlockingQueue(10);
        arrayBlockingQueue.offer("a");
        try{
            System.out.println(arrayBlockingQueue.take());
        }catch (Exception e){

        }

        Executors.newFixedThreadPool(10);
    }

}
