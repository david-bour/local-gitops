import yaml

APP_COUNT=84

def generate_apps(n):
    return [{'index': x + 1} for x in range(n)]

with open("./argocd-applications/applicationsets/nginx.applicationset.yaml") as fi:
    yaml_fi = yaml.safe_load(fi)
    yaml_fi['spec']['generators'][0]['list']['elements'] = generate_apps(APP_COUNT)

with open('./argocd-applications/applicationsets/nginx.applicationset.yaml', 'w') as fi_out:
    yaml.dump(yaml_fi, fi_out)