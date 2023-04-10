# Tea Subscription Service

## MacOS Setup

1. Clone the repository
```
git clone git@github.com:MatisseMallette/tea_subscription_service.git
```
2. Navigate to repo directory
```
cd tea_subscription_service
```
3. Install requirements
```
bundle install
```
4. Run migrations
```
rails db:{drop,create,migrate,seed}
```
5. Run the server
```
rails s
```

## Endpoints

### Create a customer

```http
POST /api/v1/customers/
```

<details close>
<summary>  Details </summary>
<br>


Parameters: <br>
```
FIRST_NAME=string
LAST_NAME=string
EMAIL=string
ADDRESS=string
```

| Code | Description |
| :--- | :--- |
| 200 | `OK` |

Example Response:

```json
{
    "data": {
        "id": "3",
        "type": "customer",
        "attributes": {
            "first_name": "jeff",
            "last_name": "johnson",
            "email": "jeffjohnson@gmail.com",
            "address": "123 Main Street"
        }
    }
}
```
</details>

### Create a subscription

```http
POST /api/v1/subscriptions/
```

<details close>
<summary>  Details </summary>
<br>


Parameters: <br>
```
TITLE=string
PRICE=string
STATUS=string
FREQUENCY=string
TEA_ID=integer
CUSTOMER_ID=integer
```

| Code | Description |
| :--- | :--- |
| 200 | `OK` |

Example Response:

```json
{
    "data": {
        "id": "1",
        "type": "subscription",
        "attributes": {
            "title": "A subscription!",
            "price": "$100",
            "status": "active",
            "frequency": "high"
        },
        "relationships": {
            "customer": {
                "data": {
                    "id": "1",
                    "type": "customer"
                }
            },
            "tea": {
                "data": {
                    "id": "1",
                    "type": "tea"
                }
            }
        }
    }
}
```
</details>
