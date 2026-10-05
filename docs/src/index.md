````@raw html
---
# https://vitepress.dev/reference/default-theme-home-page
layout: home

hero:
  name: "EntropyScaling.jl"
  text: Documentation
  image:
    src: /assets/logo.svg
    alt: EntropyScaling.jl
  tagline: Transport property modeling based on entropy scaling and equations of state
  actions:
    - theme: brand
      text: Getting started
      link: /getting_started
    - theme: alt
      text: Tutorials
      link: /tutorials
    - theme: alt
      text: View on GitHub
      link: https://github.com/se-schmitt/EntropyScaling.jl

features:
  - icon: 💧
    title: Viscosity, thermal conductivity, diffusion
    details: Model transport properties in all fluid phases based on few experimental data
    link: /transport_properties

  - icon: <img width="150" height="64" src="logos/clapeyron_without_text.svg" alt="Clapeyron"/>
    title: Built on Clapeyron.jl
    details: Use the rich thermodynamics solvers from Clapeyron.jl
    link: https://github.com/ClapeyronThermo/Clapeyron.jl

  - icon: 📊
    title: Website
    details: See our website for interactive calculation of thermodynamic properties based on the MLPROP models
    link: https://ml-prop.mv.rptu.de/
---
````

## Overview

Transport property modeling based on entropy scaling and equations of state (EOS).

This package provides methods to model

- the viscosity,
- the thermal conductivity, and
- diffusion coefficients

in a physically sound way. For the EOS calculations, additional packages need to be imported.
Alternatively, custom EOS functions can be defined. Implementations of EOS models are *not*
included in this package.

Entropy scaling makes use of the fact that transport properties can be scaled such that the
scaled transport property $Y^{\rm s}$ is a univariate function of the configurational (or
residual) entropy $s_{\rm conf}$, i.e.
$$Y^{\rm s} = Y^{\rm s}\left(s_{\rm conf}\right).$$

Entropy scaling enables the prediction of transport properties in all fluid phases based on
few experimental data.
