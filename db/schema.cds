namespace customerapp.db;

using {
    cuid,
    managed
} from '@sap/cds/common';

type CommonString : String(50);

type status       : Integer enum {
    Active   = 1;
    Inactive = 0;
}

entity Customer : cuid, managed {
    name        : CommonString @title: '{i18n>name}';
    email       : CommonString @title: '{i18n>email}';
    phone       : Integer      @title: '{i18n>phone}';
    address     : CommonString @title: '{i18n>address}';
    totalOrders : Integer      @title: '{i18n>totalOrders}';
    Status      : status       @title: '{i18n>status}';
    orders      : Composition of many Orders
                      on orders.customer = $self;
}

entity Orders : cuid, managed {
    orderDate   : DateTime               @title: '{i18n>orderDate}';
    orderStatus : localized CommonString @title: '{i18n>orderStatus}';
    quantity    : Integer                @title: '{i18n>quantity}';
    netValue    : Decimal(10, 2)         @title: '{i18n>netValue}';
    totalAmount : Decimal(10, 2)         @title: '{i18n>totalAmount}';
    customer    : Association to Customer;
}
