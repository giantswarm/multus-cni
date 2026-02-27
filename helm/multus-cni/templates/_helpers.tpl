{{/*
This file is unused, it only exists to satisfy the linter.
*/}}

{{/*
Common labels
*/}}
{{- define "labels.common" -}}
app.kubernetes.io/managed-by: {{ .Release.Service | quote }}
app.kubernetes.io/version: {{ .Chart.Version | quote }}
io.giantswarm.application.team: {{ index .Chart.Annotations "io.giantswarm.application.team" | quote }}
helm.sh/chart: {{ include "chart" . | quote }}
{{- end -}}
