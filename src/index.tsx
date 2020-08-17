import { NativeModules } from 'react-native';

type CrptModuleType = {
  multiply(a: number, b: number): Promise<number>;
};

const { CrptModule } = NativeModules;

export default CrptModule as CrptModuleType;
