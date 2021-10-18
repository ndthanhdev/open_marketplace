{{/*
Return true if a secret object should be created
*/}}
{{- define "opmar.createSecret" -}}
{{- if not (lookup "v1" "Secret" .Release.Namespace "opmar") -}}
    {{- true -}}
{{- end -}}
{{- end -}}


{{/*
Return secret-key-base
*/}}
{{- define "opmar.secretKeyBase" -}}
{{- randAlphaNum 64 | b64enc | quote -}}
{{- end -}}
