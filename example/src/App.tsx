import * as React from 'react';
import { Button, StyleSheet, View, Text } from 'react-native';
import CrptModule from 'react-native-crpt-module';

export default function App() {
  const [result, setResult] = React.useState<number | undefined>();

  React.useEffect(() => {
    CrptModule.multiply(3, 7).then(setResult);
  }, []);

  return (
    <View style={styles.container}>
      <Text>Result: {result}</Text>
      <Button
        title="Press me"
        onPress={ () => CrptModule.showExchangeFlow(8) }
      />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
});
