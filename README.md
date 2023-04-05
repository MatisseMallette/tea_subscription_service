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

### 

```http
POST /api/v1/customers/
```

<details close>
<summary>  Details </summary>
<br>


Parameters: <br>
```
first_name=string
last_name=string
email=string
address=string
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

