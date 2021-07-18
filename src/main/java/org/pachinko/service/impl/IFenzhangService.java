package org.pachinko.service.impl;

import org.pachinko.entity.Withdraw;

public interface IFenzhangService {

    public int fenzhangOrder();

    int sellerWithdraw(Withdraw record);
}
