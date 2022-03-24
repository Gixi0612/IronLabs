# -*- coding: utf-8 -*-
"""
Created on Thu Mar 24 11:17:45 2022

@author: gixi_
"""
import pandas as pd
import numpy as np
import streamlit as st

import matplotlib.pyplot as plt

from sklearn import datasets

st.set_page_config(layout="wide")

from sklearn.datasets import load_breast_cancer
breast_cancer = load_breast_cancer(as_frame=True)
breast_cancer_df = pd.concat((breast_cancer["data"], breast_cancer["target"]), axis=1)
breast_cancer_df["target"] = [breast_cancer.target_names[val] for val in breast_cancer_df["target"]]


st.markdown("Breast Cancer Stats")
st.write(breast_cancer_df)


width = st.sidebar.slider("plot width", 1, 25, 3)
height = st.sidebar.slider("plot height", 1, 25, 1)

scatter_fig = plt.figure(figsize=(width,height))

scatter_ax = scatter_fig.add_subplot(111)

malignant_df = breast_cancer_df[breast_cancer_df["target"] == "malignant"]
benign_df = breast_cancer_df[breast_cancer_df["target"] == "benign"]

malignant_df.plot.scatter(x="mean texture", y="mean area", s=120, c="tomato", alpha=0.6, ax=scatter_ax, label="Malignant")
benign_df.plot.scatter(x="mean texture", y="mean area", s=120, c="dodgerblue", alpha=0.6, ax=scatter_ax,
                       title="Mean Texture vs Mean Area", label="Benign");

st.pyplot(scatter_fig)

avg_breast_cancer_df = breast_cancer_df.groupby("target").mean()

avg_breast_cancer_df

bar_fig = plt.figure(figsize=(width,height))

bar_ax = bar_fig.add_subplot(111)

sub_avg_breast_cancer_df = avg_breast_cancer_df[["mean radius", "mean texture", "mean perimeter", "area error"]]

sub_avg_breast_cancer_df.plot.bar(alpha=0.8, ax=bar_ax, title="Average Measurements per Tumor Type");

st.pyplot(bar_fig)

hist_fig = plt.figure(figsize=(width,height))

hist_ax = hist_fig.add_subplot(111)

sub_breast_cancer_df = breast_cancer_df[["mean radius", "mean texture"]]

sub_breast_cancer_df.plot.hist(bins=50, alpha=0.7, ax=hist_ax, title="Average Measurements per Tumor Type");

st.pyplot(hist_fig)

hexbin_fig = plt.figure(figsize=(width,height))

hexbin_ax = hexbin_fig.add_subplot(111)

breast_cancer_df.plot.hexbin(x="mean texture", y="mean area",
                             reduce_C_function=np.mean,
                             gridsize=25,
                             #cmap="Greens",
                             ax=hexbin_ax,
                             title="Concentration of Measurements"
                            );
st.pyplot(hexbin_fig)
























