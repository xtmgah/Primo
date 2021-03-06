% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/conditional.R
\name{run_conditional_gwas}
\alias{run_conditional_gwas}
\title{Set up conditional analysis for known complex trait-associated variants.}
\usage{
run_conditional_gwas(Primo_obj, IDs, gwas_snps, pvals, LD_mat, snp_info,
  pp_thresh, LD_thresh = 0.9, dist_thresh = 5000,
  pval_thresh = 0.001)
}
\arguments{
\item{Primo_obj}{list returned by running the \eqn{t}-statistic version
of Primo (i.e. \code{\link{Primo_tstat}})}

\item{IDs}{data.frame of the SNP and phenotype IDs corresponding to each row
of the Primo results stored in \code{Primo_obj}.}

\item{gwas_snps}{character vector of known trait-associated (GWAS) SNPs.}

\item{pvals}{matrix of \eqn{P}-values from test statistics.}

\item{LD_mat}{matrix of LD coefficients (\eqn{r^{2}}{r^2}). Row and column names
should be SNP/variant names (i.e matching those present in \code{IDs}).}

\item{snp_info}{data.frame reporting the chromosome and position of each SNP.
Columns must include: \code{SNP, CHR, POS}.}

\item{pp_thresh}{scalar of the posterior probability threshold used for significance.}

\item{LD_thresh}{scalar corresponding to the LD coefficient (\eqn{r^{2}}{r^2})
threshold to be used for conditional analysis. Lead omics SNPs with \eqn{r^{2} <}{r^2 <}
\code{LD_thresh} with the GWAS SNP will be conditioned on.}

\item{dist_thresh}{scalar of the minimum number of base pairs away from the GWAS SNP
that a lead SNP must be in order to be conditioned on.}

\item{pval_thresh}{scalar of the \eqn{P}-value threshold a lead SNP must be below
with the phenotype for which it is lead SNP in order to be conditioned on.}
}
\value{
A list with two elements, \code{pp_grouped} and \code{fdr}.

\code{fdr} is a named vector of the estimated false discovery rates (FDR)
for each collapsed association pattern at the posterior probability
threshold, \code{pp_thresh}.

\code{pp_grouped} is a data.frame with the following information:

\itemize{
  \item SNP and trait identifiers corresponding to each observation
  \item posterior probabilities of the collapsed association patterns
  ("GWAS + at least x omics trait(s)")
  \item number of omics traits with which the SNP was associated before conditional analysis
  (at posterior probability \code{> pp_thresh})
  \item number of omics traits the SNP is associated with after conditional analysis
  \item the top association pattern after conditional analysis
}
}
\description{
For specified, known complex trait-associated (GWAS) variant(s),
set-up and run conditional analysis.
The function identifies lead omics SNPs to consider for conditional analysis,
and determines which SNPs will be conditioned on for each GWAS variant
based on specified criteria. Returns a data.frame with posterior probabilities
for collapsed association patterns and results from conditional analysis,
as well as estimated FDR for each collapsed association pattern at a
specified posterior probability threshold.
}
