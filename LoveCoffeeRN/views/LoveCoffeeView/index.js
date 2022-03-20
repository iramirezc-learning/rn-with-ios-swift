import React, { useState } from "react";
import { Text, View, Button } from "react-native";
import styles from "./styles";

const RED = "red";
const BLACK = "#333333";

const LoveCoffeeView = () => {
  const [color, setColor] = useState(RED);
  const handlePress = () => {
    console.log("Tap, tap!");
    setColor(color === RED ? BLACK : RED);
  };

  return (
    <View style={styles.container}>
      <Text style={[styles.title, { color }]}>
        Love Coffee {color === RED ? "❤️" : "🖤"}☕️
      </Text>
      <Text style={styles.subTitle}>Powered by React Native 🙌🏼🎉🥳</Text>
      <Button title="Click me" onPress={handlePress} color="#f194ff" />
    </View>
  );
};

export default LoveCoffeeView;
