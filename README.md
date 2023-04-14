# Grant Guru

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

### Get a list of customers

```http
GET /api/v1/customers/
```

<details close>
<summary>  Details </summary>
<br>

| Code | Description |
| :--- | :--- |
| 200 | `OK` |

Example Response:

```json
{
    "data": [
        {
            "id": "1",
            "type": "customer",
            "attributes": {
                "first_name": "jeff",
                "last_name": "johnson",
                "email": "jeffjohnson@gmail.com",
                "address": "123 Main Street"
            }
        },
        {
            "id": "2",
            "type": "customer",
            "attributes": {
                "first_name": "jeff",
                "last_name": "johnson",
                "email": "jeffjohnson@gmail.com",
                "address": "123 Main Street"
            }
        },
        {
            "id": "3",
            "type": "customer",
            "attributes": {
                "first_name": "jeff",
                "last_name": "johnson",
                "email": "jeffjohnson@gmail.com",
                "address": "123 Main Street"
            }
        },
        {
            "id": "4",
            "type": "customer",
            "attributes": {
                "first_name": "jeffino",
                "last_name": "johnson",
                "email": "jeffjohnson@gmail.com",
                "address": "123 Main Street"
            }
        },
        {
            "id": "5",
            "type": "customer",
            "attributes": {
                "first_name": "matisse",
                "last_name": "mallette",
                "email": "matisse@gmail.com",
                "address": "1234 Main Street"
            }
        }
    ]
}
```
</details>

### Get a list of subscriptions

```http
GET /api/v1/subscriptions/
```

<details close>
<summary>  Details </summary>
<br>

| Code | Description |
| :--- | :--- |
| 200 | `OK` |

Example Response:

```json
{
    "data": [
        {
            "id": "2",
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
        },
        {
            "id": "3",
            "type": "subscription",
            "attributes": {
                "title": "New subscription!!",
                "price": "$200",
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
        },
        {
            "id": "1",
            "type": "subscription",
            "attributes": {
                "title": "A subscription!",
                "price": "$100",
                "status": "inactive",
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
    ]
}
```
</details>

### Get a list of teas

```http
GET /api/v1/teas/
```

<details close>
<summary>  Details </summary>
<br>

| Code | Description |
| :--- | :--- |
| 200 | `OK` |

Example Response:

```json
{
    "data": [
        {
            "id": "1",
            "type": "tea",
            "attributes": {
                "title": "Tea1",
                "description": "Tea1 description",
                "temperature": "Tea1 temperature",
                "brew_time": "Tea1 brew time"
            }
        },
        {
            "id": "2",
            "type": "tea",
            "attributes": {
                "title": "Tea2",
                "description": "Tea2 description",
                "temperature": "Tea2 temperature",
                "brew_time": "Tea2 brew time"
            }
        },
        {
            "id": "3",
            "type": "tea",
            "attributes": {
                "title": "Tea3",
                "description": "Tea3 description",
                "temperature": "Tea3 temperature",
                "brew_time": "Tea3 brew time"
            }
        }
    ]
}
```
</details>
