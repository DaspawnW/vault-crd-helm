{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "vault-crd.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "vault-crd.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "vault-crd.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}


{{- define "vault-crd.service-account-name" -}}
{{ required "vaultCRD.serviceAccountName is required!" .Values.vaultCRD.serviceAccountName  | quote }}
{{- end -}}

{{- define "vault-crd.pod-running-policy-name" -}}
{{ printf "%s-%s" (include "vault-crd.fullname" .) "pod-running-policy" }}
{{- end -}}

{{- define "vault-crd.role-name" -}}
{{ printf "%s-%s" (include "vault-crd.fullname" .) "use-pod-security-policy-role" }}
{{- end -}}

{{- define "vault-crd.role-binding-name" -}}
{{ printf "%s-%s" (include "vault-crd.fullname" .) "use-pod-security-policy" }}
{{- end -}}