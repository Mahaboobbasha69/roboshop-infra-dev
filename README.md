# roboshop-infra-dev


Below is a logical traffic flow diagram based on how sg.yaml is usually written in Roboshop-style projects.
                INTERNET
                    |
                    | 80 / 443
                    v
              ┌─────────────┐
              │   ALB SG    │
              │ (LoadBalancer)
              └─────────────┘
                    |
                    | 80
                    v
              ┌─────────────┐
              │ FRONTEND SG │
              └─────────────┘
                    |
                    | 8080
                    v
              ┌─────────────┐
              │ BACKEND SG  │
              └─────────────┘
                    |
     ┌──────────────┼──────────────┐
     |               |              |
     | 27017         | 3306         | 6379
     v               v              v
┌─────────┐     ┌─────────┐    ┌─────────┐
│ MONGO SG│     │ MYSQL SG│    │ REDIS SG│
└─────────┘     └─────────┘    └─────────┘

🔐 Key Security Concepts

❌ Internet cannot access DBs directly

✔ Only specific SG → SG traffic is allowed

✔ Backend can talk to DBs

✔ Frontend can talk only to backend

✔ ALB is the only public entry point

This diagram is exactly what sg.yaml enforces.
