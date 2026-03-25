import groovy.json.JsonSlurper
def proc= ["curl", "--url", "https://api.octoperf.com/runtime/scenarios/by-project/BSruw44BqQahJeAt-mOY", "-H", "Authorization: Bearer XXXXX"].execute()
proc.waitFor()
def data = new JsonSlurper().parseText(proc.text)
print data.collect{t->t.name+": ["+t.id+"]"}
return  data.collect{t->t.name+": ["+t.id+"]"}