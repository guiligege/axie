package org.pachinko.entity;

import lombok.Data;

@Data
public class UserSearch {

    private int pageSize = 20;
    private int currentPage = 1;
    private String loginId;
    private int start = 0;


    public int getNextPage() {
        return currentPage + 1;
    }

    public int getPrePage() {
        if (currentPage <= 1) {
            return 1;
        } else {
            return currentPage - 1;
        }
    }

    public void initStart(){
        start = pageSize*(currentPage-1);
    }

    public UserSearch(){

    }

    public UserSearch(String loginId,int currentPage){
        this.loginId=loginId;
        this.currentPage=currentPage;
        this.start =  pageSize*(currentPage-1);
    }


}