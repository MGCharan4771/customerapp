const cds = require('@sap/cds');

class CustomerService extends cds.ApplicationService {
    init() {
        const { Customers, Orders } = this.entities;
        this.before('CREATE', Customers, this.ValidatePhoneNumber);
        this.on('updateStatus', this.onUpdateStatus)
        return super.init()
    }
    ValidatePhoneNumber(req, res) {
        console.log(req.data.phone)
        const { phone } = req.data;
        var phoneString = phone.toString();
        var regularExp = /^\d{10}$/g;
        if (regularExp.test(phoneString)) {
            console.log('Phone Number Validated')
        } else {
            req.error`Phone Number Invalid ${phone}`;
        }
    }

    async onUpdateStatus(req) {
        const {orderID} = req.data;
        let record = await SELECT.one.from(Orders).where({
            ID : orderID
        })
    }
}
module.exports = CustomerService;