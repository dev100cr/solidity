pragma solidity >=0.4.25 <0.9.0;

contract Shipping {
    // Our predefined values for shipping listed as enums
    enum ShippingStatus {
        Pending,
        Shipped,
        Delivered
    }

    // Save enum ShippingStatus in variable status
    ShippingStatus private status;

    // Event to launch when package has arrived
    event LogNewAlert(string description);

    // This initializes our contract state (sets enum to Pending once the program starts)
    constructor() {
        status = ShippingStatus.Pending;
    }

    // Function to change to Shipped
    function Shipped() public {
        status = ShippingStatus.Shipped;
        emit LogNewAlert("Your package has been shipped");
    }

    // Function to change to Delivered
    function Delivered() public {
        status = ShippingStatus.Delivered;
        emit LogNewAlert("Your package has arrived");
    }

    // Function to get the status of the shipping
    function getStatus(
        ShippingStatus _status
    ) internal pure returns (string memory) {
        if (_status == ShippingStatus.Pending) {
            return "Pending";
        } else if (_status == ShippingStatus.Shipped) {
            return "Shipped";
        } else if (_status == ShippingStatus.Delivered) {
            return "Delivered";
        } else {
            return "Unknown";
        }
    }

    // Get status of your shipped item
    function Status() public view returns (string memory) {
        ShippingStatus _status = status;
        return getStatus(_status);
    }
}
