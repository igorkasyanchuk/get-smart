## ⚙️ Canary Deployments with Flagger on Kubernetes

Implement progressive rollouts by using Flagger with Istio/Contour to shift traffic gradually between old and new versions. Configure health checks, alert thresholds, and automation hooks to ensure rollback on anomalies. This approach reduces blast radius and lets you test in production with real user traffic.

```yaml
apiVersion: flagger.app/v1beta1
kind: Canary
metadata:
  name: rails-app
  namespace: production
spec:
  targetRef:
    apiVersion: apps/v1
    kind: Deployment
    name: rails-app
  progressDeadlineSeconds: 60
  service:
    port: 80
    targetPort: 3000
  analysis:
    interval: 30s
    threshold: 10
    maxWeight: 50
    stepWeight: 10
    metrics:
    - name: request-success-rate
      threshold: 99
      interval: 1m
```