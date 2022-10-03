# Task 3: Terraform

## Exercise Goals

* Create a Terraform script named `main.tf` to:
  * Use the local backend;
  * Use the [Kubernetes Provider](https://registry.terraform.io/providers/hashicorp/kubernetes/latest);
  * Connect to your `minikube` context, using your local `.kube/config;
  * Load the `app.yaml` from your last task in this module and apply it to your `minukube` context;
* Init your terraform script;
* Apply your terraform script;

## Expected Output

Please, provide us with the `main.tf` you created. Your `main.yaml` is supposed to:

* Use local backend;
* Use the Kubernetes Provider mentioned before;
* Apply your `app.yaml` to your minikube;

Please, provide us with the `terraform.state` file that was created when you ran `terraform apply`;

[Optional] You can also share screenshots of your progress.

```bash
terraform init

terraform plan -input=false -out=my-plan

terraform apply "my-plan"
```

### Evidences

* 0-terraform-init.png
* 1-terraform-plan.png
* 2-terraform-apply-running.png
* 3-terraform-apply-done.png

## Next steps?

Once you complete this task, you can proceed to the [Linux](../linux) task;
