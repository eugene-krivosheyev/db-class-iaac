# DB class provisioning IaaC

---

# Загрузочная флешка
- [ ] [Zorin Os Core](https://zorinos.com/download/)

# Загрузка с флешки @F12 и установка ОС
- [ ] Сразу соединяемся к WiFi
- [ ] Keyboard Layout: Russia
- [ ] Download Updates, Install third-party software
- [ ] Erase disk and install
- [ ] Moscow Location
- [ ] Пользователь: **developer**
- [ ] Имя хоста devstation

# Настройка BIOS @F2 после установки ОС
## Configuration
- [ ] Integrated Graphics Controller: Forces
- [ ] UMA Frame Buffer Size: 256m
- [ ] HotKey Mode: Disabled
- [ ] Always on USB: Disabled
## Security
- [ ] Set Administrator Password
## Boot
- [ ] Boot Mode: UEFI
- [ ] USB Boot: Disabled
- [ ] PXE Boot to LAN: Disabled

# Первый запуск

- [ ] Яркость экрана на половину
- [ ] Выключить звук
- [ ] Подключиться к WiFi
- [ ] Установить Additional Drivers

# Ручной первичный провиженинг
- [ ] Обеспечить доступ по ssh извне
```bash
sudo apt install openssh-server
sudo echo "Port 22" | sudo tee -a /etc/ssh/ssh_config > /dev/null
sudo systemctl restart ssh.service 
sudo ufw allow 22
ip address show | grep global
```
или по [ссылке](https://tinyurl.com/ekr-ssh)
- [ ] Добавить адрес в [hosts.yml](/ansible/hosts.yml)

# Автоматический провиженинг
- [ ] Cбросить ssh кеша хостов
```bash
ssh-keygen -R 192.168.1.49
```

- [ ] Smoke Test конфигурации хостов
```bash
ansible -i ansible/inventory.yml --ask-pass --ask-become-pass -m shell -a 'uname -a' all
```

- [ ] Провиженинг базовых фич
```bash
ansible-playbook --ask-pass --ask-become-pass -i ansible/inventory.yml ansible/playbook.yml
```
