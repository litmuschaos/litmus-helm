# Run E2E tests using GitHub Chaos Actions 

- When you commit code to your repository, you can continuously build and test the code to make sure that the commit doesn't introduce errors. The error could be in the form of some security issue, functional issue, or performance issue which can be tested using different custom tests, linters, or by pulling actions. This brings the need of having *Chaos Actions* which will perform a chaos test on the application over a particular commit which in-turn helps to track the performance of the application on a commit level. This can be done by commenting on the Pull Request. 

## Through comments on PR

- We can run tests for any desired experiment or set of experiments by just commenting on the Pull Request. The format of comment will be:

```bash

/run-e2e-<test-name/test-group>

```

_Experiments Available for custom bot:_

<table style="width:100%">
  <tr>
    <th>Resource chaos</th>
    <th>Network Chaos</th>
    <th>IO Chaos</th>
    <th>Others</th>    
  </tr>
  <tr>
    <td>pod-cpu-hog</td>
    <td>pod-network-latency</td>
    <td>node-io-stress</td>
    <td>pod-delete</td>    
  </tr>
  <tr>
    <td>pod-memory-hog</td>
    <td>pod-network-loss</td>
    <td></td>
    <td>container-kill</td>    
  </tr>
  <tr>
    <td>node-cpu-hog</td>
    <td>pod-network-corruption</td>
    <td></td>
    <td>pod-autoscaler</td>    
  </tr>
  <tr>
    <td>node-memory-hog</td>
    <td>pod-network-duplication</td>
    <td></td>
    <td></td>    
  </tr>  
</table>

### Group Tests

<table style="width:100%">
  <tr>
    <th>Command</th>
    <th>Description</th>
  </tr>
  <tr>
    <td><code>/run-e2e-all</code></td>
    <td>Runs all available tests. This includes all resource chaos test, network chaos test, IO test and other tests. It will update the comment if it gets passed.</td>
  </tr>
  <tr>
    <td><code>/run-e2e-network-chaos</code></td>
    <td>Runs all network chaos tests. This includes pod network corruption, pod network duplication, pod network loss, pod network latency.</td>
  </tr> 
  <tr>
    <td><code>/run-e2e-resource-chaos</code></td>
    <td>Runs all resource chaos tests. This includes pod level cpu and memory chaos test and node level cpu and memory chaos test.</td>
  </tr>   
  <tr>
    <td><code>/run-e2e-io-chaos</code></td>
    <td>Runs all io chaos tests. Currently it only includes node io stress</td>
  </tr>   
</table>

