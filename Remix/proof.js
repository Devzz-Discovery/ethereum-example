(async () => {
    try {
        console.log('Running Web3 script...')
        
        const contractName = 'Proof' // название контракта
        const constructorArgs = []  
        const deployedContract = '0xD7ACd2a9FD159E69Bb102A1ca21C9a3e3A5F771B' // адрес развернутого контракта. Укажите свой
    
        // Note that the script needs the ABI which is generated from the compilation artifact.
        // Make sure contract is compiled and artifacts are generated
        const artifactsPath = `browser/contracts/artifacts/${contractName}.json` // Change this for different path

        // парсим json, создаем объект контракта
        const metadata = JSON.parse(await remix.call('fileManager', 'getFile', artifactsPath))
        const contract = new web3.eth.Contract(metadata.abi, deployedContract)
        console.log('JSON ABI:', metadata.abi)

        // выводим информацию по аккаунту
        const accounts = await web3.eth.getAccounts()
        console.log('Default account:', accounts[0])

        // вызываем метод контракта и добавляем новую запись с владельцем файла
        console.log('Running set method')
        await contract.methods.set('jack', 'AeDe046f6').send({
            from: accounts[0],
            gas: 1500000,
            gasPrice: '30000000000'
        })

        // вызываем метод контракта для получения владельца файла по хэшу
        console.log('Running get method')
        contract.methods.get('AeDe046f6').call(function (err, res) {
            if (err) {
                console.log("An error occured", err)
                return
            }
            console.log("File info: ", res)
        })
 
    } catch (e) {
        console.log(e.message)
    }
  })()