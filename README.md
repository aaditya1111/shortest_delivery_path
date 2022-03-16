# shortest_delivery_path

<h3>Assumptions :-</h3>

1. Language Used to code: Ruby

2. There would be 6 possible pathways for Aman to deliver foods from R1 & R2 restaurants to C1 & C2 customers.

                        A -> R2 -> R1 -> C1 -> C2
                        A -> R2 -> R1 -> C2 -> C1
                        A -> R1 -> C1 -> R2 -> C2
                        A -> R2 -> C2 -> R1 -> C1
                        A -> R1 -> R2 -> C1 -> C2
                        A -> R1 -> R2 -> C2 -> C1

                        A implies for Aman
                        R1 implies for Restaurant-1
                        R2 implies for Restaurant-2
                        C1 implies for Customer-1
                        C2 implies for Customee-2

2. Assuming I will be getting latitudes and longitudes for each respective point.

3. Normal travel speed will be 20 km/hr.

4. For given sample data:

            latA = 18.175702
            lonA = 73.356194
            latR2 = 18.154988
            lonR2 = 73.295022
            latR1 = 19.115143
            lonR1 = 72.854969
            latC1 = 19.184224
            lonC1 = 72.820271
            latC2 = 19.136132
            lonC2 = 72.792327


            After executing given code ->>>>

            {
                "A R2 R1 C2 C1" -> 6.817072810730628 hrs
                "A R2 R1 C1 C2" -> 6.893058242582865 hrs
                "A R2 C2 R1 C1" -> 7.181015195284461 hrs
                "A R1 R2 C2 C1" -> 18.041112594688794 hrs
                "A R1 R2 C1 C2" -> 18.222190353850245 hrs
                "A R1 C1 R2 C2" -> 18.58613273840408 hrs
            }

            Shortest Path will be -> "A R2 R1 C2 C1" ~ (A -> R2 -> R1 -> C2 -> C1) - it's taking minimum time for delivery
