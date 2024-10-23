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
    name        : CommonString @title : '{i18n>name}';
    email       : CommonString @title : '{i18n>email}';
    phone       : Integer;
    address     : CommonString;
    totalOrders : Integer;
    Status      : status;
    orders      : Composition of many Orders
                      on orders.customer = $self;
}

entity Orders : cuid, managed {
    orderDate   : DateTime;
    orderStatus : localized CommonString;
    quantity    : Integer;
    netValue    : Decimal(10, 2);
    totalAmount : Decimal(10, 2);
    customer    : Association to Customer;
}
