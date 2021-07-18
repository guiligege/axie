package org.pachinko.service.impl;

import java.util.Calendar;
import java.util.UUID;

import lombok.extern.slf4j.Slf4j;
import org.pachinko.dao.IUserDao;
import org.pachinko.dto.UserDTO;
import org.pachinko.dto.UserParam;
import org.pachinko.entity.ChongZhi;
import org.pachinko.entity.User;
import org.pachinko.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;

@Slf4j
@Service("userService")
public class UserServiceImpl implements IUserService {

    @Autowired
    private IUserDao userDao;

    @Override
    public UserDTO loginByChecker(String ronin, String pwd) {

        User user =  this.getByRonin(ronin);
        if(null == user){
            return null;
        }

        String inputPwd = DigestUtils.md5DigestAsHex(pwd.getBytes());
        if(!user.getPassword().equals(inputPwd)){
            log.warn("ronin:{},pwd:{} error",ronin,pwd);
            return null;
        }

        UserDTO userDTO = new  UserDTO();
        userDTO.buildBaseUserDTO(user.getId(),user.getNick(),user.getRonin());
        Calendar calendar = Calendar.getInstance();
        calendar.add(Calendar.DATE, 1);

        userDTO.buildExpire(calendar.getTime(), UUID.randomUUID().toString().replace("-",""));
        return userDTO;
    }

    @Override
    public int registByRonin(UserParam userParam) {

        User user = new User();
        //(String nick,String password,String email,String ronin,String dailiCode)/
        String pwd = DigestUtils.md5DigestAsHex(userParam.getPassword().getBytes());

        user.fillBaseUser(userParam.getNick(),pwd,userParam.getEmail(),userParam.getRonin(),userParam.getDailiCode());

        int result = userDao.insert(user);
        return  result;
    }

    @Override
    public User selectDailiByCode(String dailiCode) {

        return  userDao.selectDailiByCode(dailiCode);
    }

    @Override
    public User getByRonin(String ronin) {

        return  userDao.selectByLoginId(ronin);
    }

    @Override
    public User getByNick(String nick) {

        return  userDao.selectByNick(nick);
    }

    @Override
    public User getByUserId(Integer userId) {
        return  userDao.selectByPrimaryKey(userId);
    }

    @Override
    public boolean freeze(String ronin,String operator) {

        User user =  this.getByRonin(operator);
        if(null == user){
            return false;
        }
        if(!user.isAdmin()){

            log.warn("not admin operator is:{}",operator);
            return false;
        }

        User roninuser =  this.getByRonin(ronin);
        if(null == roninuser){

            log.warn("user not exist ronin is:{}",ronin);
            return false;
        }
        roninuser.setStatus(0);
        userDao.updateByPrimaryKey(roninuser);
        return true;
    }

    @Override
    public boolean updateTag(String ronin,boolean ischongzhi) {

        User roninuser =  this.getByRonin(ronin);
        if(null == roninuser){

            log.warn("user not exist ronin is:{}",ronin);
            return false;
        }
        if(ischongzhi){
            roninuser.setTag(ChongZhi.CHONGZHI_SUCCESS_TAG);
        }else{
            roninuser.setTag(ChongZhi.TIXIAN_SUCCESS_TAG);
        }

        userDao.updateByPrimaryKey(roninuser);
        return true;
    }



    @Override
    public boolean checkUserPermission(String ronin) {

        User user =  this.getByRonin(ronin);
        if(null == user){
            return false;
        }

        //如果没有押金那么不允许发布商品
        if(user.getDeposit().compareTo(User.DEFAULT)<=0){
            return false;
        }

        return true;
    }
}
