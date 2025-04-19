## 🛡️ Canary Deployments on Kubernetes with Helm

Implement canary releases to gradually shift traffic to a new Rails version, allowing you to monitor errors before full rollout. Using Helm’s `maxSurge` and `maxUnavailable` settings plus a custom service subset, you can direct a small percentage of traffic to the new release.

Example `values.yaml` for a canary Helm chart:

```yaml
deployment:
  replicas: 5
  strategy:
    type: RollingUpdate
    rollingUpdate:
      maxSurge: 1
      maxUnavailable: 0

service:
  type: ClusterIP
  ports:
    - port: 80
      targetPort: 3000

canary:
  enabled: true
  weight: 10 # send 10% of traffic to canary
```  

And configure an Istio VirtualService to split traffic:

```yaml
apiVersion: networking.istio.io/v1alpha3
kind: VirtualService
metadata:
  name: rails-app
spec:
  hosts:
    - "rails.example.com"
  http:
    - route:
        - destination:
            host: rails-app
            subset: stable
          weight: {{ .Values.canary.enabled | ternary (100 - .Values.canary.weight) 100 }}
        - destination:
            host: rails-app
            subset: canary
          weight: {{ .Values.canary.weight }}
```  

With this, only 10% of your users hit the new pod subset labeled `canary`. Monitor logs and metrics; if everything looks healthy, bump `weight` to 100 and disable the canary label.  
