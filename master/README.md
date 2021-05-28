# Machine Maitre

## Rappel network 

master : 192.168.40.10

## Lancement de la machine Maitre

Lancer un terminal (exemple: Git bash)

```console
Tp_deploiement_continue/master (main)$ vagrant up
```

A la fin du script de lancement : 

Affichage de la version d'Ansible et du mot de passe admin jenkins (Vérification de l'installation des applications à la fin du script) : 

```console
    master: 2021-05-28 10:00:38 [ INFO  ] : Déploiement machine Master Terminé 
    master: 2021-05-28 10:00:38 [ INFO  ] : Version d'Ansible 
    master: ansible 2.5.1
    master:   config file = /etc/ansible/ansible.cfg
    master:   configured module search path = [u'/root/.ansible/plugins/modules', u'/usr/share/ansible/plugins/modules']
    master:   ansible python module location = /usr/lib/python2.7/dist-packages/ansible
    master:   executable location = /usr/bin/ansible
    master:   python version = 2.7.17 (default, Feb 27 2021, 15:10:58) [GCC 7.5.0]
    master: 2021-05-28 10:00:39 [ INFO  ] : Mot de passe jenkins ... 
    master: d744c9703e3c4d77b9c6b26148fc25a6
```

