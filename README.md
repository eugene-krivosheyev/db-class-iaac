# DB class provisioning IaaC

---

# Загрузка с флешки @F12 и установка ОС
- [ ] Сразу соединяемся к WiFi: ekr@bk.ru
- [ ] Keyboard Layout: Russia
- [ ] Minimal installation, Download Updates, Install third-party software
- [ ] Erase disk and install Ubuntu
- [ ] Moscow Location
- [ ] Пользователь: administrator
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
- [ ] Подключиться к WiFi
- [ ] Ubuntu предлагает накатить обновления - накатить
- [ ] Ubuntu выдает ошибку про локаль/язык - качать предложенную поддержку языка
- [ ] Яркость экрана на половину
- [ ] Выключить звук

# Ручной первичный провиженинг
- [ ] Обеспечить доступ по ssh извне
```bash
sudo apt install openssh-server
sudo echo "Port 22" | sudo tee -a /etc/ssh/ssh_config > /dev/null
sudo systemctl restart ssh.service 
ip address show | grep global
```
или по [ссылке](https://tinyurl.com/ekr-ssh)
- [ ] Добавить адрес в _hosts.yml_

# Автоматический провиженинг
- [x] Cбросить ssh кеша хостов
```bash
ssh-keygen -R 192.168.1.49
```

- [ ] Smoke Test конфигурации хостов
```bash
ansible -i ansible/hosts.yml --ask-pass --ask-become-pass -m shell -a 'uname -a' all
```

- [ ] Провиженинг базовых фич
```bash
ansible-playbook --ask-pass --ask-become-pass -i ansible/hosts.yml ansible/inventory.yml [--skip-tags "homedir4developer"] [--start-at-task='Shut down CI docker containers'] [--step] [--tags "ansible"] [--limit dev_stations] [-vvv]
```
