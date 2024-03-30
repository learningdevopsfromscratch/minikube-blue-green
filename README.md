# Blue Green
Enabled same namespace blue/green

Components
1. Ingress in Namespace A
2. Service Green in Namespace A
3. Service Blue in Namespace A

Perform the switch on the "ingress" and swapping the service target

# Blue Green Different Namespace
Enabled cross namespace blue/green

Components
1. Ingress in Namespace A
2. Service in Namespace A (Type: ExternalName)
3. Service Green in Namespace Green
4. Service Blue in Namespace Blue
   
Perform the switch on the "service" and swapping the service target
