## 🚀 Subscribe to GraphQL in Real Time

Use Apollo Client’s subscriptions with Stimulus to update UI reactively. Initialize the subscription in `connect()`, and teardown in `disconnect()` to avoid dangling observers.

```javascript
import { Controller } from '@hotwired/stimulus'
import { ApolloClient, InMemoryCache, split, HttpLink } from '@apollo/client'
import { WebSocketLink } from '@apollo/client/link/ws'
import { getMainDefinition } from '@apollo/client/utilities'

export default class extends Controller {
  connect() {
    const httpLink = new HttpLink({ uri: '/graphql' })
    const wsLink = new WebSocketLink({ uri: 'ws://localhost:4000/graphql', options: { reconnect: true } })
    const link = split(
      ({ query }) => {
        const def = getMainDefinition(query)
        return def.kind === 'OperationDefinition' && def.operation === 'subscription'
      },
      wsLink,
      httpLink
    )

    this.client = new ApolloClient({ link, cache: new InMemoryCache() })

    this.subscription = this.client.subscribe({
      query: YOUR_SUBSCRIPTION_QUERY
    }).subscribe({
      next: ({ data }) => this.renderUpdate(data)
    })
  }

  disconnect() {
    this.subscription.unsubscribe()
  }

  renderUpdate(data) {
    // update DOM
  }
}
```