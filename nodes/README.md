# Nodes

Create nodes here in the JSON files.

To install nodes on the server, use knife.

# knife node

The knife node subcommand is used to manage the nodes on a Chef server.

```
$ knife node bulk delete REGEX (options)
$ knife node create NODE (options)
$ knife node delete NODE (options)
$ knife node edit NODE (options)
$ knife node environment set NODE ENVIRONMENT
$ knife node from file FILE (options)
$ knife node list (options)
$ knife node run_list add [NODE] [ENTRY[,ENTRY]] (options)
$ knife node run_list remove [NODE] [ENTRY[,ENTRY]] (options)
$ knife node run_list set NODE ENTRIES (options)
$ knife node show NODE (options)
$ knife node status [<node> <node> ...]
```

To import all nodes from the Chef server with attributes and run list, enter:
```
for node in `knife node list`; do knife node show $node -Fj > $node.json; done
```

To import all nodes with run list only, enter:
```
for node in `knife node list`; do knife node show $node -Fj -r > $node.json; done
```

# For example

```
{
  "name": "chef-server",
  "chef_environment": "vagrant",
  "policy_name": null,
  "policy_group": null,
  "run_list": [
    "role[base]",
    "role[chef-server]
  ]
}
```
