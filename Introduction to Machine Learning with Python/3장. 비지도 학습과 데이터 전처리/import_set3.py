# sklearn dataset
from sklearn.datasets import load_breast_cancer
from sklearn.datasets import make_blobs
from sklearn.datasets import fetch_lfw_people
from sklearn.datasets import load_digits

from sklearn.model_selection import train_test_split
from sklearn.metrics import accuracy_score

# 전처리
from sklearn.preprocessing import MinMaxScaler
from sklearn.preprocessing import QuantileTransformer, StandardScaler, PowerTransformer

# 성분 분석
from sklearn.decomposition import PCA
from sklearn.decomposition import NMF

# 매니폴드
from sklearn.manifold import TSNE

# 클러스터
from sklearn.cluster import KMeans
from sklearn.cluster import AgglomerativeClustering
from sklearn.cluster import DBSCAN
from scipy.cluster.hierarchy import dendrogram, ward
from sklearn.metrics.cluster import adjusted_rand_score
from sklearn.metrics.cluster import silhouette_score

# 모델
from sklearn.svm import SVC
from sklearn.neighbors import KNeighborsClassifier