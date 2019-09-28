# Hashi Corp Vault Introduction And Installation


### What is Vault ?
Basically vault is a tool/software that allows us to access the **secret messages** securely.
  Now the secret message can be considered as the conglomeration of folowing things
  -  API Keys
  - Passwords
  - Certifcates
  -  Database Credentials
 
### Why vault is too secure ?
  - It make uses of tight access control policies , that makes it too secure
  - Also it is used to store data in encrypted form ,and in order to decrypt the data , that requires the master key (generated from the concept of **Shamir Crypto Algorithm** 


### Features Of Vault are :-
  - **D**  :- Data Encryption
  - **L**  :- Leasing and Renewal
  - **D**  :- Dynamic Secrets
  - **S**  :- Secure Secret Storage

### Use Cases Of Vault 
 - **A** :- API Key Generation  for scripts (means accessing the credentials only during execution of script)
 - **G** :- General Secret Storage
 - **E** :- Employee Credential Storage
 - **D** :- Data Encryption (also allows the facility to encrypt the user data)


## Vault Vs Other Software

 ### 1. Vault vs Chef,Pupet etc 
     Problem :- How to store the credentials securely ?**
     Chef puppet encrypt the data using one key 
     date + key -> secret
     whereas on the other hand , the vault encrypt/decrypts the data using multiple keys(procedures)
     through a process known as unsealing

### 2. Vault vs HSMs(Hardware Security Module)
    Drawback of using HSM :-
    HSM is a hardware module, that take care of securing the secret messages,but on the other hand the cost of handling the HSM module also increases.
    Moreover configuring the HSM is also a tedious task.
    Also , it becomes very difficult to automate the HSMs module handling 
    
### 3. Vault Vs Dropbox
    It also a bad idea to store the  secrets on the platform such as :- Dropbox
    
### 4. Vault Vs Consul
    Consul serve as a system for service discovery, monitoring and configuration in disributed environment
    In case of consul, data is not encrypted in transit or at rest
    
### 5. Vault Vs Amazon KMS
     KMS (Key Management Service) is one of the AWS service used for encryption key management.
     On contrary, vault is a open source tool for achieving a comprehensive key management solution
   
### 6. Vault Vs Keywhiz 
    Basically both tools performs the same functionality , but vault also provides the opportunity for leasing and renewal
    
    
### INSTALLATION OF VAULT


Step 1:- Download the binary file

```sh
wget https://releases.hashicorp.com/vault/0.10.3/vault_0.10.3_linux_amd64.zip
```
![](https://preview.ibb.co/kKhd98/vault_1.png)


Step 2:- Unzip the binary file
```sh
unzip vault_0.10.3_linux_and64.zip
```
![](https://preview.ibb.co/eFG5p8/vault_2.png")

Step 3:- Make global entry of vault to /usr/bin
```sh
sudo cp -avr vault /usr/local/bin
```
![](https://preview.ibb.co/ez4rU8/vault_3.png)
Here v means verbose, r means recursive

Step 4:- Check the vault version
```sh
vault --version
```
![](https://preview.ibb.co/hScZhT/vault_4.png)

## Commands After Installation


### Step 1:- To start the vault development server on the local machine
```sh
vault server -dev -dev-listen-address=127.0.0.1:1234
export VAULT_ADDR='http://127.0.0.1:1234'
```

### Step 2:- Now we need to put the password in the vault ,so type the following commands
```sh
vault kv put secret/bakul password=qwertyuiopasdfghjklzxcvbnm0987654321
```

### Step 3:- After successfully writing the password into the vault, lets view the password
```sh
vault kv get secret/bakul
```

Here kv means the key-value type of secret engine

### Step 4:- If u want to view the secret engine present in vault by default type the following command
```sh
vault secrets list
```

### NOTE  :- If you are facing problem in GET request using kv version 2,while using API then type the following ccommand
```sh
vault secrets disable secret
vault secrets enable -version=1 -path=secret kv
```



# Vault Configuration (Own Vault Server Deployment)

## Step 1:- Write a vault.conf file (Acceptable format :- hcl/json)
>backend "file" 
>{
>path="/home/bakul/name"
>}
>listener "tcp"
>{
>address="127.0.0.1:8200"
>tls_disable=1
>}


## Step 2:- Start the vault server using the following command

```sh
vault server -config /home/bakul/vault.conf
```

## Step 3:- Now set the vaule VAULT_ADDR enviroment variable globally
```sh
EXPORT VAULT_ADDR='http://127.0.0.1:8200'
```

## Step 3:- Now generate the root token as well as the unseal key , in order to unseal the vault
```sh
vault operator init -key-shares=1 -key-threshold=1 -tls-skip-verify -address=http://127.0.0.1:8200
```

>Now a unseal key as well as token will be generated , so save it into some file
>Unseal key :- 1234567wertycbsnbmand5wryqtbdnmsamdias
>Root Token :- 98762refbvhu76tfghbhutghjju87tyghjuyy **(say abc_root)**

## Step 4:- Unseal the vault
```sh
vault unseal <Unseal_Key>
```

## Step 5:- Login to the vault using root token
```sh
vault login <Root_Token_Value>
```

## Use of HTTP API OF VAULT

### STEP 1:- USE OF POST  METHOD to save data to vault
```sh
curl -H "X-Vault-Token: abc_root" -X POST @lukab.json http://127.0.0.1:8200/v1/secret/ssh_password
```

### Content of lukab.json file
>{
>"ssh_username": "bakul",
>"ssh_password": "lukab"
>}

### STEP 2:- Retrieve the data using the GET request

```sh
curl -H "X-Vault-Token:abc_root" -X GET http://127.0.0.1:8200/v1/secret/ssh_password
```

    
   
