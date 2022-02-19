pragma solidity 0.4.16;

contract Proof
{
    struct FileDetails {
        uint timestamp;
        string owner;
    }

    mapping (string => FileDetails) files;

    event logFileAddedStatus(bool status, uint timestamp, string owner, string fileHash);
    
    //функция для сохранения владельца файла и метки времени блока
    function set(string owner, string fileHash) {
        //не существует корректного способа проверить,
        //есть ли уже такой ключ,
        //поэтому мы проверяем значение по умолчанию (все биты нулевые)
        if(files[fileHash].timestamp == 0) {
                files[fileHash] = FileDetails(block.timestamp, owner);

                //мы создаем событие, благодаря которому программа-оболочка
                //узнает от контракта, что наличие файла
                //и принадлежности сохранено
                logFileAddedStatus(true, block.timestamp, owner, fileHash);
        }
        else {
            //здесь мы сообщаем программе-оболочке, что
            //подтверждение существования
            //и принадлежности не могут быть сохранены, потому
            //что данные файла
            //уже были сохранены раньше
            logFileAddedStatus(false, block.timestamp, owner, fileHash);
        }
    }

    //функция для получения сведений о файле
    function get(string fileHash) returns (uint timestamp, string owner) {
        return (files[fileHash].timestamp, files[fileHash].owner);
    }
}