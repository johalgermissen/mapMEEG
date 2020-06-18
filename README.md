# Mapping the parameter space in EEG/MEG analyses (mapMEEG)


<!-- TOC -->
- [Mapping the parameter space in EEG/MEG analyses (mapMEEG)](#mapping-the-parameter-space-in-eeg-meg-analyses--mapmeeg-)
  * [Idea and history](#idea-and-history)
  * [Future steps to do](#future-steps-to-do)
  * [How to contribute](#how-to-contribute)
  * [Related projects](#related-projects)
  * [Useful links and other resources](#useful-links-and-other-resources)
    + [Published guidelines and pipelines](#published-guidelines-and-pipelines)
    + [Reporting of specific parameters](#reporting-of-specific-parameters)
  * [Contributors](#contributors)
<!-- /TOC -->

## Idea and history

This project was initiated at the [OHBM Hackathon 2020](https://ohbm.github.io/hackathon2020/) ([initial issue here](https://github.com/ohbm/hackathon2020/issues/139)), intially as a git-0/ no code project. It is a project with an  educational goal.

The idea was to provide help for less experienced EEG/ MEG researchers to **get started on pre-registration featuring MEG/ EEG** by creating a **pre-registration template** in a **bottom-up manner**. 

More specifically, we pursued the following steps:
- *identify* existing pre-registrations featuring EEG/ MEG
- *classify* those pre-registrations according to a few criterion using [this **Google form**](https://forms.gle/Rr5qHKzBEjuZSSgBA).
    - which creates an overview in this  [**Google spreadsheet** (read-only link)](https://docs.google.com/spreadsheets/d/1-tTgpDOKOAUG-zdfqAnbBfPOsCDvGC5wzaOLKdBAcWc/edit?usp=sharing).
    - for a list of pre-registrations still to be classified see [**this list** (read-only link)](https://docs.google.com/document/d/1FT6bg89dUQscQ1JNm3mFaWht5SkfIhQeaBkGlbT6EO4/edit?usp=sharing).
- systematically _screen_ those pre-registrations for the following criteria:
    - What are steps that are regularly _under-specified_?
    - What are steps that are regularly _forgotten_?
    - What are steps for which researchers regularly _deviate_ from their initially pre-registered pipeline?
    - What are _good practices_ that facilitate readability and understanding in the user?
- come up with a simple _framework_ for an EEG/ MEG pre-registration pipeline
- create an **adaptive shiny app** that allows users to fill in typical EEG/ MEG pipeline parameters and automatically creates human-readable text that can be copy-pasted into a pre-registration
    - See this repository
    - **Current prototype** hosted on https://johalgermissen.shinyapps.io/mapMEEG_proto/

## Future steps to do
- Spreadsheet overview of existing pre-registrations:
    - Code more pre-registration from [the queue](https://docs.google.com/document/d/1FT6bg89dUQscQ1JNm3mFaWht5SkfIhQeaBkGlbT6EO4/edit?usp=sharing).
    - rate pre-registrations for level of elaboration/ detail-
    - compare pre-registrations to finally published journal articles to identify deviations.
    - compare pre-registrations to registered reports (level of detail, deviations).
    - identify pre-processing steps specific to MEG.
- Shiny app:
    - Separate tabs for data collection, data pre-processing, data analyses.
    - Separate tabs for EEG and MEG.
    - Allow researchers to fill in a certain step multiple times and feature it at different time points within their pipeline
    - Allow researchers to determine the order in which steps are outputed in the text document
    - Helper links with:
        - short explanation on each parameter.
        - short example.
        - reference to respective software options in commonly used packages (e.g. EEGLAB, Fieldtrip, MNE Python)
        - reference to further literature

## How to contribute

If you'd like to get involved, join the `hbmhack-mapMEEG` channel on the brainhack mattermost. <a href="https://mattermost.brainhack.org/brainhack/channels/mapmeeg"><img src="http://www.mattermost.org/wp-content/uploads/2016/03/logoHorizontal.png" width=100px /> Join our channel </a>

Alternatively, you can open a new issue on this repository itself if there is something you would like to discuss directly here. We're also happy about direct pull requests to improve our app.

## Related projects
* [EEGManyLabs project (related tweets on Twitter)](https://twitter.com/hashtag/eegmanylabs?lang=en)
* [ManyPipelines project (launch tweet on Twitter)](https://twitter.com/TomRhysMarshall/status/1265606022716108805?s=20)
* [EEG Pre-registration template started at SIPS 2019 and continued at the MPI-CBS, Leipzig, Germany](https://docs.google.com/document/d/1RmlHcWJcWMErZzjJgz9Q0rqsy-E9Vs9DYeKdvX9cawU/edit#heading=h.pbxfutwvnppx)

## Useful links and other resources

### Published guidelines and pipelines
- COBIDAS-MEEG guidelines: https://cobidasmeeg.wordpress.com/
    - Preprint [Best Practices in Data Analysis and Sharing in Neuroimaging using MEEG](https://osf.io/a8dhx/)
- [Pipeline by Steve Luck on erpinfo.org](https://erpinfo.org/order-of-steps)
- [Makoto's pre-processing pipeline  in EEGLAB (Swartz Center for Computational Neuroscience, UCSD)](https://sccn.ucsd.edu/wiki/Makoto's_preprocessing_pipeline)
- [Special Issue in _Frontiers in Neuroscience_ 2017: From raw MEG/EEG to publication: how to perform MEG/EEG group analysis with free academic software.](https://www.frontiersin.org/research-topics/5158/from-raw-megeeg-to-publication-how-to-perform-megeeg-group-analysis-with-free-academic-software#articles), including among others:
    - [Frömer, R., Maier, M., & Abdel Rahman, R. (2018). Group-level EEG-processing pipeline for flexible single trial-based analyses including linear mixed models. _Frontiers in Neuroscience_, 12, 48.](https://www.frontiersin.org/articles/10.3389/fnins.2018.00048/full)
    - [Jas, M., Larson, E., Engemann, D. A., Leppäkangas, J., Taulu, S., Hämäläinen, M., & Gramfort, A. (2018). A reproducible MEG/EEG group study with the MNE software: recommendations, quality assessments, and good practices. Frontiers in neuroscience, 12, 530.](https://www.frontiersin.org/articles/10.3389/fnins.2018.00530/full)
- [Keil, A., Debener, S., Gratton, G., Junghöfer, M., Kappenman, E. S., Luck, S. J., ... & Yee, C. M. (2014). Committee report: publication guidelines and recommendations for studies using electroencephalography and magnetoencephalography. _Psychophysiology_, 51(1), 1-21.](https://onlinelibrary.wiley.com/doi/full/10.1111/psyp.12147)
- [Robbins, K. A., Touryan, J., Mullen, T., Kothe, C., & Bigdely-Shamlo, N. (2020). How Sensitive are EEG Results to Preprocessing Methods: A Benchmarking Study. _IEEE Transactions on Neural Systems and Rehabilitation Engineering_, 28(5), 1081-1090.](https://ieeexplore.ieee.org/abstract/document/9047940)

### Reporting of specific parameters
* Beamforming: [Jaiswal, A., Nenonen, J., Stenroos, M., Gramfort, A., Dalal, S. S., Westner, B. U., ... & Oostenveld, R. (2020). Comparison of beamformer implementations for MEG source localization. _NeuroImage_, 116797.](https://www.sciencedirect.com/science/article/pii/S1053811920302846)
(https://onlinelibrary.wiley.com/doi/full/10.1111/psyp.12639)
* Morlet wavelets: [Cohen, M. X. (2019). A better way to define and describe Morlet wavelets for time-frequency analysis. _NeuroImage_, 199, 81-86.](https://www.sciencedirect.com/science/article/pii/S1053811919304409)
* Temporal filtering: [Luck, S. J., & Gaspelin, N. (2017). How to get statistically significant effects in any ERP experiment (and why you shouldn't). _Psychophysiology_, 54(1), 146-157.](https://onlinelibrary.wiley.com/doi/abs/10.1111/psyp.12639)

## Contributors

Thanks goes to these wonderful people ([emoji key](https://allcontributors.org/docs/en/emoji-key)):

This project follows the [all-contributors](https://github.com/all-contributors/all-contributors) specification. Contributions of any kind welcome!

## LICENSE

[MIT](LICENSE)