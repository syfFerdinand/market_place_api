# Market place api

**This repository is a demo of api rest with Rails**


## Requirments

- Ruby 2.5+
- Sqlite

## Setup

```bash
git clone https://github.com/madeindjs/market_place_api_6
cd market_place_api_6
bundle install
rake db:create
rake db:migrate
```

## Usage
Before use api create user and obtain his token. Use this token for every action on endpoint
### Create user

```
curl -X POST -d 'user[email]=toto@toto.fr' -d 'user[password]=toto1234' localhost:3000/api/v1/users
```

### Obtain token

```
curl -X POST -d 'user[email]=toto@toto.fr' -d 'user[password]=toto1234' localhost:3000/api/v1/tokens
```

## Manage product

```
export TKN="eyJhbG...WqaXAcnE" # from /api/v1/tokens
```
### create
```
curl -X POST -H "Authorization: $TKN" -d "product[title]=Bag" -d "product[price]=10" localhost:3000/api/v1/products
```
### update: publish and add stock
```
curl -X PATCH -H "Authorization: $TKN" -d "product[published]=true" -d "product[quantity]=2" localhost:3000/api/v1/products/19
```
### list
```
curl -H "Authorization: $TKN" localhost:3000/api/v1/products
```
### delete
```
curl -X DELETE -H "Authorization: $TKN" localhost:3000/api/v1/products/19
```

## Manage order

```sh
export TKN="eyJhbG...WqaXAcnE" # from /api/v1/tokens
```
### create
```
curl -X POST -H "Authorization: $TKN" -d "order[product_ids_and_quantities][][product_id]=20" -d "order[product_ids_and_quantities][][quantity]=1" localhost:3000/api/v1/orders
```
### list
```
curl -H "Authorization: $TKN" localhost:3000/api/v1/orders
```
### show
```
curl -H "Authorization: $TKN" localhost:3000/api/v1/orders/7
```
