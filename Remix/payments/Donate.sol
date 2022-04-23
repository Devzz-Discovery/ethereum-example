pragma solidity 0.8.13;

/*
 Контракт для получения донатов с сохранением в блокчейне имени пользователя, отправившего самый крупый донат
*/
contract Donate
{
    string private tipper = "no winner"; 
    uint private amount;

    // метод для обработки поступающих донатов
    function pay() public payable {
        sendDonate("incognito");
    }

    // метод для получения значения текущего баланса контракта
    function getContractBalance() public view returns (uint) {
        uint balance = address(this).balance;
        return  balance;
    }

    // метод для отправки нового доната
    function sendDonate(string memory name) public payable {
        if (msg.value > amount) {
            amount = msg.value;
            tipper = name;
        }
    }

    // метод для определения самого большого доната
    function getBestTipper() public view returns (string memory) {
        return tipper;
    } 
}