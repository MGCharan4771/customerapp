using {customerapp.db as db} from '../db/schema';

service CustomerService {
    entity Customers as projection on db.Customer;
    entity Orders as projection on db.Orders;

    action updateStatus(orderID : UUID) returns String;
}
