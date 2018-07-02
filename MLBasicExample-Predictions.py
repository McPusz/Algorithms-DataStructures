from sklearn import tree

# features: weight and fruit texture: 1 - smooth, 0 - bumpy
# labels: 0 - apple, 1 - orange

# Collect training data
features = [[140, 1], [130, 1], [150, 0], [170, 0]]
labels = [0, 0, 1, 1]

# Train classifier
clf = tree.DecisionTreeClassifier()
clf = clf.fit(features, labels)
# Make predictions
print(clf.predict([[150, 0]]))
