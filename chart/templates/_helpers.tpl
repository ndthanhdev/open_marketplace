{{- define "opmar.secretName" -}}
{{ .Release.Name }}-opmar
{{- end -}}

{{/*
Return true if a secret object should be created
*/}}
{{- define "opmar.createSecret" -}}
{{- if not (lookup "v1" "Secret" .Release.Namespace (include "opmar.secretName" .) ) -}}
    {{- true -}}
{{- end -}}
{{- end -}}

{{/*
Return secret-key-base
*/}}
{{- define "opmar.secretKeyBase" -}}
{{- randAlphaNum 64 | b64enc | quote -}}
{{- end -}}

{{/*
Return secret-key-base
*/}}
{{- define "opmar.redisPassword" -}}
{{- randAlphaNum 16 | b64enc | quote -}}
{{- end -}}