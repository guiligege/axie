package org.pachinko.domain;

import lombok.Data;

/**
 * Description: 随机数据，奖金和押注
 * Date: 2018/8/4
 * Time: 下午12:35
 */
@Data
public class RandomDO implements Comparable<RandomDO>{

    private String randomKey;
    //总奖金
    private Integer totelReward;
    //总押注
    private Integer totalMoney;

    public RandomDO(){

    }

    public RandomDO(String randomKey, Integer totelReward){
        this.randomKey = randomKey;
        this.totelReward = totelReward;
    }

    public RandomDO(String randomKey, Integer totelReward,Integer totalMoney){
        this.randomKey = randomKey;
        this.totelReward = totelReward;
        this.totalMoney = totalMoney;
    }

    @Override
    public int compareTo(RandomDO a) {
        return this.totelReward.compareTo(a.getTotelReward());
    }

}
