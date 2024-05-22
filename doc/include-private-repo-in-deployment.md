## Include private images from ghcr.io to kubernetes deployment

1. Craete a .dockerconfigjson file. Check this link for details: https://kubernetes.io/docs/tasks/configure-pod-container/pull-image-private-registry/ or you can also check example in k8s/original-templates/.dockerconfigjson file. 
  Step 1. Here you need to run the following command: `echo -n "<github-username>:<github-pat-token-generated-to-access-image>" | base64` 
  Step 2. Output-example: `ZGV2LWtoYWxpZDpnaHBfSVNLckVFa1BWYXR6a2IyRG9TYWtJV3AzaFY4ZmdGMnU4****`
  Step 3. Take that and put it inside .dockerconfigjson file
  Step 4. Take the whole file content make it in json format like this: `{"auths":{"ghcr.io":{"auth":"ZGV2LWtoYWxpZDpnaHBfSVNLckVFa1BWYXR6a2IyRG9TYWtJV3AzaFY4ZmdGMnU4****"}}}`
  Step 5. Now again convert it to base64 format.
  Step 6. Put it inside a dockerconfigjson.yaml files data>.dockerconfigjson caluse and use it inside deployment.yaml file with imagePullSecret clause.
